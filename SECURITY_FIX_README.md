# Security fix: admin login

**What was wrong:** on both sites, the login page didn't actually check the
password stored in the database. Dan Creatives had the real check replaced
with a hardcoded `admin`/`admin123` comparison directly in the code. Dan
Decor did check the database, but using MD5, a weak, outdated hashing
method. Either way, anyone with access to the site's code could see your
password.

**What changed:**
- Both sites now check your password against a real, securely hashed value
  in the `admin_users` table (using PHP's `password_verify`, the standard,
  modern approach).
- A **Change Password** page was added to both admin panels (sidebar link),
  so you can set your own password whenever you like, without needing SQL.

**What you need to do (one-time, ~1 minute):**

1. Import `dan_creatives_security_fix.sql` into the `dan_creatives_db`
   database (or `dan_decor_security_fix.sql` into `dan_decor`) via
   phpMyAdmin's SQL tab, same way as the AI setup file.
2. Log in as usual with `admin` / `admin123`.
3. Go to **Change Password** in the sidebar and set a real password only
   you know.

Until step 1 is done, login will briefly stop working (there's no hardcoded
fallback anymore) — that's expected, and resolves the moment you run the
SQL file.
