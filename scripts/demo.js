/**
 * Generate demo data
 */
function Data() {
  clear();
  fakeDepts();
  fakeUsers();
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
