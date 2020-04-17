git submodule update --init --recursive

cd 2.0;
mkdocs build;
cd ..;

cd 3.0;
mkdocs build;
cd ..;

cd 4.0;
mkdocs build;
cd ..;

cd 1.5;
couscous generate;
cd ..;

cd cn;
mkdocs build;
cd ..;

rm -rf build
mkdir -p build;

cd leaf-pygment && ./compile.sh
cd .. && pip install leaf-pygment/dist/leaf-0.1.0-dev.tar.gz

mv 2.0/site build/2.0;
mv 3.0/site build/3.0;
mv 4.0/site build/4.0;
mv 1.5/.couscous/generated build/1.5;

mv cn/site build/cn;

echo "<meta http-equiv=\"refresh\" content=\"0; url=/3.0/\">" > build/index.html;
git add .
git commit -am "deploy"
git push
vapor cloud deploy --env=production --build=incremental -y
