git submodule update --init --recursive

cd 4.0;
mkdocs build;
cd ..;

cd cn;
mkdocs build;
cd ..;

rm -rf build;
mkdir -p build;

mv 4.0/site build/4.0;
mv cn/site build/cn;

echo "<meta http-equiv=\"refresh\" content=\"0; url=/4.0/\">" > build/index.html;