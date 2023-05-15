/**
 * Generate demo data
 */
function Data() {
 // clear();
  fakeProducts();
  fakeSuppliers();
  fakeDepts();
  fakeUsers();
  fakeProjects();
}

function fakeProjects() {
  model = "project";
  fakeData = fake("projects");
  columns = ["id", "sn", "name", "start", "end", "status"];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([
      row[0].trim(),
      row[1].trim(),
      row[2].trim(),
      new Date(row[3].trim()).toISOString().split(".")[0],
      new Date(row[4].trim()).toISOString().split(".")[0],
      row[5].trim(),
    ]);
  });
  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }

  fakeProjectMembers();
  fakeProjectSteps();
  fakeProjectMilestons();
  fakeTasks();
  fakeTemplates();
}

function fakeTemplates() {
  bytes = fake("project_templates", "json");
  template = JSON.parse(bytes);
  res = Process(`models.project.template.save`, template);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeTasks() {
  model = "task";
  fakeData = fake("tasks");
  columns = [
    "id",
    "milestone_id",
    "step_id",
    "project_id",
    "name",
    "start_plan",
    "end_plan",
    "start",
    "end",
    "delayed",
    "delivered",
    "status",
  ];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([
      row[0].trim(), //id
      row[1].trim(), // milestone_id
      row[2].trim(), // step_id
      row[3].trim(), // project_id
      row[6].trim(), // name
      row[7].trim() == "null"
        ? null
        : new Date(row[7].trim()).toISOString().split(".")[0], // start_plan
      row[8].trim() == "null"
        ? null
        : new Date(row[8].trim()).toISOString().split(".")[0], // start_plan
      row[9].trim() == "null"
        ? null
        : new Date(row[9].trim()).toISOString().split(".")[0], // start
      row[10].trim() == "null"
        ? null
        : new Date(row[10].trim()).toISOString().split(".")[0], // end
      row[11].trim().toLowerCase() == "true", // delayed
      row[12].trim().toLowerCase() == "true", // status
      row[13].trim(),
    ]);
  });

  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }

  fakeTaskDeliverables();
  fakeTaskMembers();
}

function fakeTaskMembers() {
  columns = ["project_id", "task_id", "staff_id", "is_manager"];
  data = [];
  tasks = Process("models.task.Get", {
    limit: 500,
    select: ["id", "project_id"],
  });

  member_id = 1;
  tasks.forEach((task) => {
    offset = (task.project_id - 1) * 6;
    data.push([task.project_id, task.id, member_id + offset, true]);
    data.push([task.project_id, task.id, member_id + offset + 1, false]);
    member_id = member_id + 2;
    if (member_id > 6) {
      member_id = 1;
    }
  });
  res = Process(`models.task.member.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeTaskDeliverables() {
  model = "task.deliverable";
  fakeData = fake("task_deliverables");
  columns = [
    "id",
    "task_id",
    "project_id",
    "name",
    "nums",
    "product_id",
    "status",
  ];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([
      row[0].trim(), // id
      row[1].trim(), // task_id
      row[4].trim(), // project_id
      row[8].trim(), // name
      row[9].trim(), // nums
      row[10].trim() == "0" ? null : row[10].trim(), // product_id
      row[11].trim(), // status
    ]);
  });
  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeProjectMilestons() {
  model = "project.milestone";
  fakeData = fake("project_milestones");
  columns = ["id", "step_id", "project_id", "name"];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([row[0].trim(), row[1].trim(), row[2].trim(), row[4].trim()]);
  });
  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeProjectSteps() {
  model = "project.step";
  fakeData = fake("project_steps");
  columns = ["id", "project_id", "name"];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([row[0].trim(), row[1].trim(), row[2].trim()]);
  });
  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
}

function fakeProjectMembers() {
  model = "project.member";
  fakeData = fake("project_members");
  columns = ["project_id", "staff_id", "is_manager"];
  data = [];

  fakeData.forEach((line, i) => {
    row = line.split(",");
    data.push([
      row[0].trim(),
      row[1].trim(),
      row[2].trim().toLowerCase() == "true",
    ]);
  });
  res = Process(`models.${model}.insert`, columns, data);
  res = res || {};
  if (res.code && res.message) {
    throw new Exception(res.message, res.code);
  }
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
  qb.Get({ sql: { stmt: "truncate project;" } });
  qb.Get({ sql: { stmt: "truncate project_step;" } });
  qb.Get({ sql: { stmt: "truncate project_milestone;" } });
  qb.Get({ sql: { stmt: "truncate project_template;" } });
  qb.Get({ sql: { stmt: "truncate project_member;" } });
  qb.Get({ sql: { stmt: "truncate project_template;" } });
  qb.Get({ sql: { stmt: "truncate task;" } });
  qb.Get({ sql: { stmt: "truncate task_deliverable;" } });
  qb.Get({ sql: { stmt: "truncate task_member;" } });
}

/**
 * Read Fake data
 * @param {*} name
 * @returns
 */
function fake(name, ext) {
  ext = ext || "txt";
  var lang = Process("yao.env.Get", "YAO_LANG") || "zh-cn";
  var file = `/fake/${name}.${lang.toLowerCase()}.${ext}`;
  var fs = new FS();
  var txt = fs.ReadFile(file);
  return ext == "txt" ? txt.split("\n") : txt;
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
