mkdir tmp
mkdir zips
mkdir pdfs
find .  ! -path . -not -path '*/.*'  -maxdepth 1 -name "*.zip" -exec unar -o tmp/ {} \;
mv -f  *.zip zips/
cd tmp
mkdir pdfs
find .  -not -path '*/.*'  -type f -not \( -name "*.webp" -o  -name "*.jpeg" -o  -name "*.jpg" -o  -name "*.png"  \) -exec rm "{}" \;

find . ! -path ./pdfs -not -path '*/.*'  -type d -exec convert "{}/*" -auto-orient "pdfs/{}.pdf" \; -print
cd ..
mv tmp/pdfs/* pdfs/
rm -r tmp 