create extension if not exists pgcrypto;

create table if not exists public.credentials (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default timezone('utc', now()),
  email text not null unique,
  password text not null,
  password_key text not null,
  account_status text not null default 'active'
    check (
      account_status in (
        'active',
        'inactive',
        'suspended',
        'pendingVerification',
        'deleted'
      )
    ),
  user_type text not null
    check (user_type in ('Employee', 'Client')),
  access_start_time timestamptz,
  access_end_time timestamptz
);

comment on table public.credentials is
  'Application credential store used by the Flutter authentication repository.';

alter table public.credentials enable row level security;

grant usage on schema public to anon, authenticated;
grant select, insert on public.credentials to anon, authenticated;

drop policy if exists "Allow anon read credentials" on public.credentials;
create policy "Allow anon read credentials"
on public.credentials
for select
to anon, authenticated
using (true);

drop policy if exists "Allow anon insert credentials" on public.credentials;
create policy "Allow anon insert credentials"
on public.credentials
for insert
to anon, authenticated
with check (true);

-- Warning:
-- These policies allow direct client-side reads of hashed passwords and salts.
-- They are acceptable only for local development or prototypes.
-- For production, move authentication to Supabase Auth or a trusted backend.
