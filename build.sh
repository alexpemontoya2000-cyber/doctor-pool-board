#!/bin/bash
# Build script: replaces placeholders in template with env vars
# Used by Vercel as the build command

set -e

if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_ANON_KEY" ]; then
  echo "ERROR: SUPABASE_URL and SUPABASE_ANON_KEY must be set"
  exit 1
fi

cp index.template.html index.html
sed -i "s|__SUPABASE_URL__|${SUPABASE_URL}|g" index.html
sed -i "s|__SUPABASE_ANON_KEY__|${SUPABASE_ANON_KEY}|g" index.html

echo "Build complete — index.html generated with credentials"
