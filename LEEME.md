# Ivonny Swim — tienda web

**En vivo:** https://ivonny-swim.vercel.app
**Panel:** https://ivonny-swim.vercel.app/admin

| | |
|---|---|
| Hosting | Vercel · proyecto `ivonny-swim` (cuenta felixxcito) |
| Base de datos y fotos | Supabase · proyecto `ivonny-swim` (`ktgsqjlorymskgfsktbo`, us-east-1) |
| Tablas | `productos`, `config` · bucket `fotos` |
| Seguridad | RLS: cualquiera lee el catálogo, solo quien inicia sesión escribe |

## Publicar cambios

```bash
cd /Users/felix/Desktop/ivonny-swim && npx vercel --prod
```

## Cómo entra Ivonny

1. Va a **ivonny-swim.vercel.app/admin**
2. Correo y contraseña (la sesión le queda guardada en el teléfono)
3. Le aparece el botón **Mi panel** abajo a la derecha

**Face ID:** dentro de *Mi panel → Mi tienda* puede activar *Entrar con Face ID*.
A partir de ahí, al abrir el panel le pide la cara en vez de la contraseña.
Es una cerradura local del teléfono, no reemplaza la contraseña: si falla,
siempre puede entrar escribiéndola.

## Cambiarle la contraseña

Supabase → **Authentication → Users** → los tres puntos junto a su correo →
*Reset password*, o *Update user* para ponerle una nueva.

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
