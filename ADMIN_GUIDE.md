# How to Use Your Admin Panel

## 1. Opening the admin panel

| Site | Admin login URL |
|---|---|
| **Dan Creatives** | `yoursite.com/admin_login_handler.php` |
| **Dan Decor** | `yoursite.com/admin/login.php` |

**Default login:** `admin` / `admin123`

⚠️ **Important — do this first:** your old admin password wasn't actually
being checked properly (see `SECURITY_FIX_README.md`). Run the included
security-fix SQL file once, log in with `admin` / `admin123` as normal, then
immediately go to **Change Password** in the sidebar and set your own
password. From then on, only you know it.

## 2. What each section does

Both admin panels are one dashboard page with a sidebar. Click a section and
the page updates in place — you don't navigate away.

- **Dashboard** — overview stats, and every "Add / Edit" form (events,
  packages, gallery, products, courses, portfolio, about page, depending on
  the site).
- **AI Assistant** — set up and monitor your AI chat helper (see the
  separate `AI_ASSISTANT_SETUP` guide).
- **Change Password** — update your login password any time.
- **Questions / Registrations / Orders / Requests** (Dan Creatives only) —
  read-only lists of what visitors have submitted through the site.
- **Logout** — always do this on shared or public computers.

## 3. Adding a photo (new — direct upload)

Every image field across both admin panels now works the same way:

1. Click **"Upload image"** (or **"Upload image or video"** for gallery/
   portfolio fields).
2. Pick a photo from your phone or computer.
3. Wait a second — you'll see **"✓ Uploaded"** and a thumbnail preview
   appear right there in the form.
4. Save the form as normal (Save Event, Save Product, etc.) — nothing else
   changes.

You can still paste a link into the text box above the upload button
instead, if you'd rather use an image already hosted somewhere else — both
ways work side by side.

**Limits:** images up to 5MB, videos up to 20MB. Supported types: JPG, PNG,
WEBP, GIF, MP4, WEBM.

Uploaded files are saved in a new `uploads/images/` folder on your site —
back this folder up along with your database, since that's where your
photos now physically live.

## 4. Day-to-day example: adding a new package/product

1. Dashboard → find the relevant section (e.g. "Packages" on Dan Decor,
   "Products" on Dan Creatives) → **Add**.
2. Fill in the name, price, and description.
3. Click **Upload image**, choose a photo, wait for the checkmark.
4. Click **Save**. It appears on the live site immediately — and the AI
   assistant already knows about it, since it reads the database live.

## 5. If something looks wrong

- Photo not showing on the site? Open the admin form for that item and
  check the image field shows a thumbnail — if it's blank, re-upload.
- Can't log in? Double-check you ran the security-fix SQL file and are
  using your current password (not the old default, if you already changed
  it).
- Anything else — the AI Assistant's "Conversations" tab is often the
  fastest way to see what visitors are actually asking and running into.
