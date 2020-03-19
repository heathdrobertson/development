const chalk = require('chalk')
const figlet = require('figlet')

console.log(
    chalk.yellow(
        figlet.textSync("Hello Heath's Javascript World", { horizontalLayout: 'full' })
    )
)
