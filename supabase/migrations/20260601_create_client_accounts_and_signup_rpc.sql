create table if not exists public.client_accounts (
  id uuid primary key default gen_random_uuid(),
  credential_id uuid not null unique references public.credentials(id) on delete cascade,
  created_at timestamptz not null default timezone('utc', now()),
  first_name text not null,
  last_name text not null,
  email text not null,
  middle_name text,
  birth_date date,
  phone_number text,
  profile_picture_url text
);

comment on table public.client_accounts is
  'Client profile records linked one-to-one with application credentials.';

alter table public.client_accounts enable row level security;

grant select, insert, update on public.client_accounts to anon, authenticated;

drop policy if exists "Allow anon read client accounts" on public.client_accounts;
create policy "Allow anon read client accounts"
on public.client_accounts
for select
to anon, authenticated
using (true);

drop policy if exists "Allow anon insert client accounts" on public.client_accounts;
create policy "Allow anon insert client accounts"
on public.client_accounts
for insert
to anon, authenticated
with check (true);

drop policy if exists "Allow anon update client accounts" on public.client_accounts;
create policy "Allow anon update client accounts"
on public.client_accounts
for update
to anon, authenticated
using (true)
with check (true);

create or replace function public.signup_client(
  p_email text,
  p_password text,
  p_password_key text,
  p_first_name text,
  p_last_name text
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_email text := lower(trim(coalesce(p_email, '')));
  v_first_name text := trim(coalesce(p_first_name, ''));
  v_last_name text := trim(coalesce(p_last_name, ''));
  v_credential public.credentials%rowtype;
  v_client_account public.client_accounts%rowtype;
begin
  if v_email = '' then
    raise exception 'Email is required.' using errcode = '22023';
  end if;

  if coalesce(p_password, '') = '' then
    raise exception 'Password is required.' using errcode = '22023';
  end if;

  if coalesce(p_password_key, '') = '' then
    raise exception 'Password key is required.' using errcode = '22023';
  end if;

  if v_first_name = '' then
    raise exception 'First name is required.' using errcode = '22023';
  end if;

  if v_last_name = '' then
    raise exception 'Last name is required.' using errcode = '22023';
  end if;

  insert into public.credentials (
    email,
    password,
    password_key,
    account_status,
    user_type
  )
  values (
    v_email,
    p_password,
    p_password_key,
    'active',
    'Client'
  )
  returning * into v_credential;

  insert into public.client_accounts (
    credential_id,
    first_name,
    last_name,
    email
  )
  values (
    v_credential.id,
    v_first_name,
    v_last_name,
    v_email
  )
  returning * into v_client_account;

  return jsonb_build_object(
    'credential', to_jsonb(v_credential),
    'clientProfile', to_jsonb(v_client_account)
  );
end;
$$;

grant execute on function public.signup_client(text, text, text, text, text)
to anon, authenticated;
