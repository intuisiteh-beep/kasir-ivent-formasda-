-- Impor awal menu dari website Intuisi Teh ke tabel Admin Menu.
-- Jalankan sekali setelah setup-admin-menu.sql berhasil.
-- Tidak menghapus atau mengubah tabel transaksi kasir.
with seed(name, series, prices, image_url, active, updated_at) as (
  values
  ('Intuisi Tea', 'Series Tea', '{"STD":4000}'::jsonb, './jasmine-tea-product-mockup.webp', true, now()),
  ('Green Tea', 'Series Tea', '{"STD":6000}'::jsonb, './refreshing-iced-green-tea-advertisement.webp', true, now()),
  ('Pandan Tea', 'Series Tea', '{"STD":6000}'::jsonb, './pandan-tea-freshness-campaign.webp', true, now()),
  ('Vanilla Tea', 'Series Tea', '{"STD":6000}'::jsonb, './premium-vanilla-iced-tea-advertisement.webp', true, now()),
  ('Lychee Tea', 'Series Tea', '{"STD":6000}'::jsonb, './lychee-tea-branding-delight.webp', true, now()),
  ('Lemon Tea', 'Series Tea', '{"STD":6000}'::jsonb, './iced-lemon-tea-branding-scene.webp', true, now()),
  ('Peach Tea', 'Series Tea', '{"STD":6000}'::jsonb, './refreshing-peach-tea-product-showcase.webp', true, now()),
  ('Apple Tea', 'Series Tea', '{"STD":6000}'::jsonb, './refreshing-apple-tea-advertisement.webp', true, now()),
  ('Mango Tea', 'Series Tea', '{"STD":6000}'::jsonb, './refreshing-mango-tea-advertisement.webp', true, now()),
  ('Strawberry Tea', 'Series Tea', '{"STD":6000}'::jsonb, './strawberry-tea-cafe-advertisement.webp', true, now()),
  ('Passion Tea', 'Series Tea', '{"STD":6000}'::jsonb, './passion-tea-tropical-refreshment.webp', true, now()),
  ('Grape Tea', 'Series Tea', '{"STD":6000}'::jsonb, './grape-tea-bliss-advertisement.webp', true, now()),
  ('Melon Tea', 'Series Tea', '{"STD":6000}'::jsonb, './refreshing-melon-tea-delight.webp', true, now()),
  ('Milk Tea', 'Series Tea', '{"STD":10000}'::jsonb, './photorealistic-iced-milk-tea-advertisement.webp', true, now()),
  ('Thai Tea', 'Series Tea', '{"STD":15000}'::jsonb, './vibrant-thai-tea-brand-advertisement.webp', true, now()),
  ('Thai Green Tea', 'Series Tea', '{"STD":15000}'::jsonb, './thai-green-tea-refreshment-ad.webp', true, now()),
  ('Milo Tea', 'Series Tea', '{"STD":15000}'::jsonb, './milo-tea-iced-chocolate-cafe-promo.webp', true, now()),
  ('Matcha', 'Milk Based', '{"S":15000,"M":18000}'::jsonb, './vibrant-matcha-latte-advertisement.webp', true, now()),
  ('Black Oreo', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './black-oreo-milk-drink-advertisement.webp', true, now()),
  ('Choco Ovaltine', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './choco-ovaltine-iced-indulgence.webp', true, now()),
  ('Red Velvet', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './red-velvet-iced-drink-advertisement.webp', true, now()),
  ('Taro', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './glossy-taro-milk-tea-advertisement.webp', true, now()),
  ('Dark Choco', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './dark-choco-iced-chocolate-poster.webp', true, now()),
  ('Choco Milo', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './choco-milo-cafe-advertisement.webp', true, now()),
  ('Choco Creamy', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './choco-creamy-indulgence-by-intuisi-teh.webp', true, now()),
  ('Choco Hazelnut', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './choco-hazelnut-iced-drink-ad.webp', true, now()),
  ('Tiramisu', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './tiramisu-coffee-cafe-delight.webp', true, now()),
  ('Avocado', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './avocado-chocolate-bliss-advertisement.webp', true, now()),
  ('Banana Uyu', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './banana-chocolate-drink-advertisement.webp', true, now()),
  ('Bubblegum', 'Milk Based', '{"S":15000,"M":18000,"L":20000}'::jsonb, './bubblegum-splash-drink-advertisement.webp', true, now()),
  ('Americano', 'Coffee Latte', '{"S":10000,"M":13000}'::jsonb, './iced-americano-cafe-advertisement.webp', true, now()),
  ('Intuisi Latte', 'Coffee Latte', '{"S":13000,"M":15000}'::jsonb, './cinematic-iced-coffee-latte-advertisement.webp', true, now()),
  ('Brown Sugar Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './brown-sugar-latte-commercial-still-life.webp', true, now()),
  ('Salted Caramel', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './salted-caramel-latte-delight.webp', true, now()),
  ('Butterscotch', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './butterscotch-latte-caramel-splash.webp', true, now()),
  ('Pandan Aren Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './pandan-latte-green-cafe-promo.webp', true, now()),
  ('Vanilla Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './vanilla-latte-indulgence.webp', true, now()),
  ('Tiramisu Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './tiramisu-coffee-cafe-delight.webp', true, now()),
  ('Cappuccino', 'Coffee Latte', '{"S":16000,"M":18000}'::jsonb, './cappuccino-bliss-iced-coffee-delight.webp', true, now()),
  ('Almond Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './almond-latte-splash-advertisement.webp', true, now()),
  ('Pistachio Latte', 'Coffee Latte', '{"S":15000,"M":18000}'::jsonb, './pistachio-latte-indulgence.webp', true, now()),
  ('Caramel Macchiato', 'Coffee Latte', '{"S":18000,"M":20000}'::jsonb, './caramel-macchiato-cafe-delight.webp', true, now()),
  ('Lychee', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Mango', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Melon', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Grape', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Strawberry', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Peach', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Lemon', 'Signature Intuisi Teh', '{"Yakult":15000,"Yoghurt Breeze":18000}'::jsonb, null, true, now()),
  ('Lychee Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './lychee-squash-summer-splash.webp', true, now()),
  ('Lemon Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './lemon-squash-summer-splash.webp', true, now()),
  ('Peach Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './peach-squash-summer-splash.webp', true, now()),
  ('Mango Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './vibrant-mango-squash-advertisement.webp', true, now()),
  ('Strawberry Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './strawberry-squash-refreshment-poster.webp', true, now()),
  ('Passion Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './tropical-passion-squash-delight.webp', true, now()),
  ('Grape Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './grape-squash-splash-advertisement.webp', true, now()),
  ('Melon Squash', 'Mocktail Series', '{"M":12000}'::jsonb, './vibrant-melon-squash-beverage-poster.webp', true, now()),
  ('Blue Ocean', 'Mocktail Series', '{"M":12000}'::jsonb, './blue-ocean-tropical-refreshment.webp', true, now())
)
insert into public.public_menu_products (name, series, prices, image_url, active, updated_at)
select seed.name, seed.series, seed.prices, seed.image_url, seed.active, seed.updated_at
from seed
where not exists (
  select 1 from public.public_menu_products p
  where lower(p.name) = lower(seed.name) and p.series = seed.series
);
