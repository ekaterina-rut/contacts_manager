//@ts-ignore
import * as mysql from 'mysql2/promise';


export const contact_manager = mysql.createPool({
    host: 'MYSQL5042.site4now.net',
    user: 'a6f28b_contact',
    password: 'contact78nponpm',
    database: 'db_a6f28b_contact'
})
// export const contact_manager = mysql.createPool({
//     host: 'localhost',
//     user: 'root',
//     password: '123456789',
//     database: 'contact_manager'
// })

// console.log(trips)

