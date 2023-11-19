echo "Enter app name: ";
read app_name;

echo "🟡 Creating next app 🟡";
npx create-next-app $app_name --ts --tailwind --eslint --app --no-src-dir --import-alias '@/*';
echo "Created next app 🟢";

cd $app_name;
rm -rf public && mkdir public;
echo "Deleted files in public dir 🟢";

rm -rf README.md;
echo "Deleted readme.md file 🟢";

cd app;
rm -rf favicon.ico;
echo "Deleted favicon.ico file 🟢";

rm -rf globals.css;
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > globals.css;
echo "Prepared globals.css file 🟢";

rm -rf layout.tsx;
echo "import './globals.css';
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang='en'>
      <body>{children}</body>
    </html>
  );
}" > layout.tsx;
echo "Prepared layout.tsx file 🟢";

rm -rf page.tsx;
echo "export default function HomePage() {
  return <main></main>;
}" > page.tsx;
echo "Prepared page.tsx file 🟢";
cd ..;

echo "🟡 Adding and initializing prisma 🟡";
npm i prisma;
npx prisma init;
echo "Prepared prisma 🟢";

rm -rf .env;
echo 'DATABASE_URL="mysql://username:password@localhost:5432/mydb"' > .env;
echo "Prepared .env file 🟢";

cd prisma;

rm -rf schema.prisma;
echo 'generator client {
  provider = "prisma-client-js"
}
datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}' > schema.prisma;
echo "Prepared schema.prisma file 🟢";
echo "🟢 Done, Happy Coding! 🟢";
