-- ═══════════════════════════════════════════════════════════
--  IVONNY SWIM · esquema de base de datos
--  Pegar completo en Supabase → SQL Editor → Run
-- ═══════════════════════════════════════════════════════════

-- ── Productos ──────────────────────────────────────────────
create table if not exists productos (
  id          uuid primary key default gen_random_uuid(),
  nombre      text not null,
  precio      text not null default '0',
  categoria   text default '',
  tipo        text default 'bikini',
  tallas      text[] default '{}',
  fotos       text[] default '{}',
  nota        text default '',
  descripcion text default '',
  nuevo       boolean default false,
  orden       bigint default extract(epoch from now())*1000,
  creado      timestamptz default now()
);

-- ── Datos de la tienda (una sola fila) ─────────────────────
create table if not exists config (
  id         int primary key default 1,
  nombre     text default 'Ivonny',
  sub        text default 'SWIM',
  moneda     text default '$',
  whatsapp   text default '',
  instagram  text default '',
  aviso      text default '',
  temporada  text default '',
  constraint solo_una_fila check (id = 1)
);

insert into config (id, nombre, sub, moneda, whatsapp, instagram, aviso, temporada)
values (1, 'Ivonny', 'SWIM', '$', '584128486754', 'ivonnyswim',
        'Envío a todo el país', 'Colección verano 2026')
on conflict (id) do nothing;

-- ── Seguridad: todos leen, solo Ivonny escribe ─────────────
alter table productos enable row level security;
alter table config    enable row level security;

drop policy if exists "lectura publica productos" on productos;
create policy "lectura publica productos"
  on productos for select to anon, authenticated using (true);

drop policy if exists "escritura solo dueña productos" on productos;
create policy "escritura solo dueña productos"
  on productos for all to authenticated using (true) with check (true);

drop policy if exists "lectura publica config" on config;
create policy "lectura publica config"
  on config for select to anon, authenticated using (true);

drop policy if exists "escritura solo dueña config" on config;
create policy "escritura solo dueña config"
  on config for all to authenticated using (true) with check (true);

-- ── Almacén de fotos ───────────────────────────────────────
insert into storage.buckets (id, name, public)
values ('fotos', 'fotos', true)
on conflict (id) do nothing;

drop policy if exists "fotos lectura publica" on storage.objects;
create policy "fotos lectura publica"
  on storage.objects for select to anon, authenticated
  using (bucket_id = 'fotos');

drop policy if exists "fotos subida dueña" on storage.objects;
create policy "fotos subida dueña"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'fotos');

drop policy if exists "fotos borrado dueña" on storage.objects;
create policy "fotos borrado dueña"
  on storage.objects for delete to authenticated
  using (bucket_id = 'fotos');

-- ── Actualización en vivo del catálogo ─────────────────────
alter publication supabase_realtime add table productos;
alter publication supabase_realtime add table config;
