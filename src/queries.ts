
import { contact_manager } from './database'
import { IContact } from './interfaces';

export async function getUpdates(): Promise<any> {
    const [result] = await contact_manager.execute(
        'SELECT * FROM updates'
    )

    return result
}

const query = "CALL get_contacts_with_total_updates()";

export async function getContacts(): Promise<any> {
    const [result] = await contact_manager.execute(
        'CALL get_contacts_with_total_updates()'
    )
    return result
}



export async function addNewContact(contact: IContact): Promise<any> {
    const [insertId] = await contact_manager.execute(
        'INSERT INTO contacts (first_name, last_name, phone, email, street, city, state, postal_code, date_update) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )',
        [contact.first_name, contact.last_name, contact.phone, contact.email, contact.street, contact.city, contact.state, contact.postal_code, null]
    );
    return insertId
}

export async function checkContactValidation(first_name: string, last_name: string): Promise<boolean> {
    const [result]: any[] = await contact_manager.execute(
        "SELECT id AS user_id FROM contacts WHERE first_name = ? AND last_name = ?", [first_name, last_name]
    );
    const answer = result.length > 0;
    return answer
}

export async function updateContact(contact: IContact): Promise<any> {
    const result = await contact_manager.execute(
        `UPDATE contacts SET first_name = ?, last_name = ?, phone = ?, email = ?, street = ?, city = ?, state = ?, postal_code = ?, date_update = ? WHERE id =?`,
        [contact.first_name, contact.last_name, contact.phone, contact.email, contact.street, contact.city, contact.state, contact.postal_code, , contact.date_update, contact.id]
    )
    return result
}

export async function getContactById(id: number): Promise<any> {
    const [result]: any[] = await contact_manager.execute(
        'SELECT id AS contact FROM contacts WHERE id = ?',
        [id]
    )
    return result
}

export async function deleteContact(id: number) {
    const [result] = await contact_manager.execute(
        'DELETE FROM contacts WHERE id=? ',
        [id]
    )
    return result
}

export async function searchContact(search: string): Promise<any> {
    const [result] = await contact_manager.execute(
        `SELECT * FROM contacts WHERE first_name LIKE "%${search}%" OR last_name LIKE "%${search}%"`
    )
    return result
}


