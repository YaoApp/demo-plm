/**
 * Generate demo data
 */
function Data() {
  clear();
  fakeProducts();
  fakeSuppliers();
  fakeDepts();
  fakeUsers();
}

function fakeProducts() {
  products = fake("products");
  columns = ["sn", "name", "type", "supplier_id"];
  data = [];

  products.forEach((line, i) => {
    row = line.split(",");
    data.push([
      row[0].trim(),
      row[1].trim(),
      row[2].trim(),
      getRandomInt(1, 200),
    ]);
  });

  res = Process("models.product.insert", columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeSuppliers() {
  suppliers = fake("companies");
  columns = ["sn", "name", "province", "city"];
  data = [];

  suppliers.forEach((line, i) => {
    if (i == 0) {
      return;
    }
    row = line.split(",");
    data.push([row[11].trim(), row[0].trim(), row[8].trim(), row[9].trim()]);
  });

  res = Process("models.supplier.insert", columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

/**
 * Generate departments
 */
function fakeDepts() {
  res = Process(
    "models.department.insert",
    ["id", "name", "parent_id"],
    [
      [1, "集团总部", null],
      [2, "上海分公司", 1],
      [3, "常州分公司", 1],
    ]
  );

  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

/**
 * Generate users
 */
function fakeUsers() {
  names = fake("users");
  mobiles = fake("mobiles");
  emails = fake("emails");
  columns = ["mobile", "name", "email", "department_ids"];
  data = [];

  emails.forEach((email, i) => {
    if (!names[i] || !mobiles[i]) {
      return;
    }
    data.push([
      mobiles[i].trim(),
      names[i].trim(),
      email.trim(),
      [1, getRandomInt(2, 3)],
    ]);
  });

  res = Process("models.staff.insert", columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

/**
 * Clear data (MySQL)
 */
function clear() {
  var qb = new Query();
  qb.Get({ sql: { stmt: "truncate staff;" } });
  qb.Get({ sql: { stmt: "truncate department;" } });
  qb.Get({ sql: { stmt: "truncate product;" } });
  qb.Get({ sql: { stmt: "truncate supplier;" } });
}

/**
 * Read Fake data
 * @param {*} name
 * @returns
 */
function fake(name) {
  var lang = Process("yao.env.Get", "YAO_LANG") || "zh-cn";
  var file = `/fake/${name}.${lang.toLowerCase()}.txt`;
  var fs = new FS();
  var txt = fs.ReadFile(file);
  return txt.split("\n");
}

/**
 * Generate a int number
 * @param {*} min
 * @param {*} max
 * @returns
 */
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - 1)) + min;
}
