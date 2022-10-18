/**
 * Cloud funciton
 *
 * POST /api/__yao/app/service/foo
 * {"method":"Bar", "args":["hello", "world"]}
 *
 * @param  {...any} args
 * @returns
 */
function Bar(...args) {
  return args;
}
