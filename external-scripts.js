const BLACKLIST = [
  'hubot',
  'hubot-scripts',
  'hubot-discord'
]

console.log(
  JSON.stringify(
    Object.keys(require("./package.json").dependencies).filter(i => !BLACKLIST.includes(i) && i.includes('hubot')),
    null,
    2
  )
)
