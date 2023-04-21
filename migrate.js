const pg = require("pg");
const fs = require("fs");
const path = require("path");
const { nuti } = require("nuti");

migrate();

async function migrate() {
  const client = getClient();
  const logger = nuti.makeLogger();

  try {
    await client.connect();
    const scripts = readScripts();

    for (const script of scripts) {
      logger.info(`running ${script}`);
      const rawScript = fs.readFileSync(script, { encoding: "utf-8" });
      await client.query(rawScript);
    }

    await client.end();
    logger.info("migration has succeeded");
  } catch (error) {
    logger.error("migration has failed", { error });
  }
}

function getClient() {
  return new pg.Client({
    database: "postgres",
    user: "postgres",
    host: "postgres",
    port: 5432,
    password: "postgres",
  });
}

function readScripts() {
  const dirs = ["./db"];
  const scripts = [];

  while (dirs.length) {
    const dir = dirs.shift();

    if (!dir) break;

    fs.readdirSync(dir).forEach((file) => {
      if (file === 'queries') return;

      const fullPath = path.join(dir, file);
      const stats = fs.lstatSync(fullPath)

      const dirsOrScripts = stats.isDirectory() ? dirs : scripts;
      dirsOrScripts.push(fullPath);
    })
  }

  return scripts;
}
