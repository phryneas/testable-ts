const packageJson = require("./package.json");
const versions = Object.keys(packageJson.dependencies);

for (const version of versions) {
  console.log("testing %s", version);
  const ts = require(version);

  let program = ts.createProgram([], {});
  let checker = program.getTypeChecker();

  assert(
    typeof checker.isTypeIdenticalTo === "function",
    "something is wrong with `isTypeIdenticalTo`"
  );

  assert(
    checker.isTypeIdenticalTo
      .toString()
      .startsWith("function isTypeIdenticalTo(source, target)"),
    "`isTypeIdenticalTo` signature changed: %s",
    checker.isTypeAssignableTo.toString()
  );

  assert(
    typeof checker.isTypeAssignableTo === "function",
    "something is wrong with `isTypeAssignableTo`"
  );

  assert(
    checker.isTypeAssignableTo
      .toString()
      .match(/function (?:isTypeAssignableTo)?\(source, target\)/),
    "`isTypeAssignableTo` signature changed: %s",
    checker.isTypeAssignableTo.toString()
  );
}

function assert(condition) {
  if (!condition) {
    console.assert(...arguments);
    process.exit(1);
  }
}
