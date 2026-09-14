# Ivonny Swim — tienda web

Página estática (HTML + CSS + JS, sin build) con Supabase para los datos y las fotos.

## Archivos

| Archivo | Qué es |
|---|---|
| `index.html` | La tienda completa: catálogo público + panel de Ivonny |
| `config.js` | Las dos claves de Supabase. **Es el único archivo que debes editar** |
| `esquema.sql` | Se pega una vez en Supabase para crear las tablas |
| `vercel.json` | Configuración del deploy |

---

## 1. Supabase (5 minutos)

1. Entra a **supabase.com** y crea una cuenta (gratis, con GitHub o correo).
2. **New project** → nombre `ivonny-swim` → elige región **East US** (la más cercana a Venezuela) → guarda bien la contraseña de la base de datos.
3. Cuando termine de crearse, ve a **SQL Editor** → **New query** → pega todo el contenido de `esquema.sql` → **Run**.
   Debe decir *Success*.
4. Ve a **Authentication → Users → Add user → Create new user**:
   - Correo: el de Ivonny
   - Contraseña: la que ella vaya a usar
   - Marca **Auto Confirm User**
   Ese será su acceso al panel.
5. Ve a **Settings → API** y copia dos cosas:
   - **Project URL** (algo como `https://abcdefgh.supabase.co`)
   - **anon / public key** (una clave larga)
6. Pégalas en `config.js`.

> Esas dos claves son públicas a propósito. Quien pueda escribir está limitado por las
> políticas del `esquema.sql`: **cualquiera lee el catálogo, solo quien inicie sesión escribe.**

## 2. Vercel (2 minutos)

Desde esta carpeta:

```bash
npx vercel
```

La primera vez pide iniciar sesión (con GitHub o correo) y hace unas preguntas:
acepta los valores por defecto. Te da una URL de prueba.

Para publicar la versión definitiva:

```bash
npx vercel --prod
```

Queda en algo como `ivonny-swim.vercel.app`. Un dominio propio
(`ivonnyswim.com`) se conecta después desde **Vercel → Settings → Domains**.

---

## Cómo usa Ivonny el panel

1. Entra a la tienda y le agrega **`/#admin`** al final de la dirección.
2. Pone su correo y contraseña. La sesión le queda guardada en el teléfono.
3. Le aparece el botón **Mi panel** abajo a la derecha.

**Pestaña Productos**
- *+ Nuevo producto* → toca el recuadro y elige fotos de la galería o las toma con la cámara.
  Hasta 6 por producto; la primera es la portada y con la ⭐ cambia cuál.
- Nombre, precio, tipo y descripción corta.
- **Tallas:** cinco interruptores. Lo que apague sale tachado en la tienda y el estado
  cambia solo: *Disponible* → *Quedan 2 tallas* → *Agotado*.
- Notita a mano opcional ("mi favorito").
- *Publicar* y aparece al instante en el catálogo. También puede editar ✏️ y borrar 🗑️.

**Pestaña Mi tienda**
Nombre, WhatsApp, Instagram, moneda y el texto de la barra de arriba.

Las fotos se achican solas antes de subirse (máximo 1400 px, JPG), así que no
consume datos de más aunque las tome con el teléfono.

---

## Cambiarle la contraseña a Ivonny

Supabase → **Authentication → Users** → los tres puntos junto a su correo →
**Reset password** (o *Update user* para ponerle una nueva).
