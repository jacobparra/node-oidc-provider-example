'use strict';

const fs = require('fs');
const path = require('path');
const { createKeyStore } = require('oidc-provider');

const keystore = createKeyStore();

Promise.all([
  keystore.generate('RSA', 2048),
]).then(async () => {
  const key = await keystore.all()[0];
  console.log(key.toPEM());
  console.log(key.toPEM(true));

  fs.writeFileSync(
    path.resolve('src/keystore.json'),
    JSON.stringify(keystore.toJSON(true), null, 2),
  );
});
