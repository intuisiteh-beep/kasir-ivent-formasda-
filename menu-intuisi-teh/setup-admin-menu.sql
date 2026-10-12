-- PENGATURAN ADMIN MENU INTUISI TEH
-- 1) Ganti admin@contoh.com di SEMUA bagian bawah dengan email login kasir/admin yang sebenarnya.
-- 2) Jalankan seluruh SQL ini di Supabase Dashboard > SQL Editor.
-- 3) Setelah selesai, buka admin.html dan login memakai akun yang sama dengan kasir.
-- Catatan: tabel menu dibuat terpisah dari tabel products/sales milik kasir.

create table if not exists public.public_menu_products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  series text not null,
  prices jsonb not null default '{}'::jsonb,
  image_url text,
  active boolean not null default true,
  updated_at timestamptz not null default now()
);

alter table public.public_menu_products enable row level security;

drop policy if exists "Public can read active menu" on public.public_menu_products;
create policy "Public can read active menu"
on public.public_menu_products for select
to anon, authenticated
using (active = true or (auth.jwt() ->> 'email') = 'admin@contoh.com');

drop policy if exists "Admin can insert menu" on public.public_menu_products;
create policy "Admin can insert menu"
on public.public_menu_products for insert
to authenticated
with check ((auth.jwt() ->> 'email') = 'admin@contoh.com');

drop policy if exists "Admin can update menu" on public.public_menu_products;
create policy "Admin can update menu"
on public.public_menu_products for update
to authenticated
using ((auth.jwt() ->> 'email') = 'admin@contoh.com')
with check ((auth.jwt() ->> 'email') = 'admin@contoh.com');

drop policy if exists "Admin can delete menu" on public.public_menu_products;
create policy "Admin can delete menu"
on public.public_menu_products for delete
to authenticated
using ((auth.jwt() ->> 'email') = 'admin@contoh.com');

-- Bucket foto menu publik agar foto bisa dilihat pengunjung website.
insert into storage.buckets (id, name, public)
values ('menu-images', 'menu-images', true)
on conflict (id) do update set public = true;

drop policy if exists "Public can view menu images" on storage.objects;
create policy "Public can view menu images"
on storage.objects for select
to anon, authenticated
using (bucket_id = 'menu-images');

drop policy if exists "Admin can upload menu images" on storage.objects;
create policy "Admin can upload menu images"
on storage.objects for insert
to authenticated
with check (
  bucket_id = 'menu-images'
  and (auth.jwt() ->> 'email') = 'admin@contoh.com'
);

drop policy if exists "Admin can update menu images" on storage.objects;
create policy "Admin can update menu images"
on storage.objects for update
to authenticated
using (
  bucket_id = 'menu-images'
  and (auth.jwt() ->> 'email') = 'admin@contoh.com'
)
with check (
  bucket_id = 'menu-images'
  and (auth.jwt() ->> 'email') = 'admin@contoh.com'
);

drop policy if exists "Admin can delete menu images" on storage.objects;
create policy "Admin can delete menu images"
on storage.objects for delete
to authenticated
using (
  bucket_id = 'menu-images'
  and (auth.jwt() ->> 'email') = 'admin@contoh.com'
);
