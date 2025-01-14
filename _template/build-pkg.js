const fs = require('fs')
const { join } = require('path')

const type = process.argv[2]

const pkg = require('../package_template.json')
for (const key in pkg['merge-configs'][type]) {
  Object.assign(pkg[key], pkg['merge-configs'][type][key])
}
delete pkg['merge-configs']
fs.writeFileSync(
  join(__dirname, '/../package.json'),
  JSON.stringify(pkg, null, '  ') + '\n',
)
