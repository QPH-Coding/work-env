#!/bin/sh

sudo npm install ./node_modules/husky/ -g
sudo npm install ./node_modules/yarn/ -g

sudo npm install ./node_modules/bash-language-server/ -g
sudo npm install ./node_modules/eslint_d/ -g
sudo npm install ./node_modules/fixjson/ -g
sudo npm install ./node_modules/prettier/ -g
sudo npm install ./node_modules/sql-formatter/ -g
sudo npm install ./node_modules/sql-language-server/ -g
sudo npm install ./node_modules/stylelint/ -g
sudo npm install ./node_modules/typescript/ -g
sudo npm install ./node_modules/typescript-language-server/ -g

sudo npm install ./node_modules/pnpm/ -g
cd ./language-tools/ && pnmp install && pnpm build
