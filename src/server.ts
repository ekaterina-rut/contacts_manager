import express from 'express';
import cors from 'cors';
import { addNewContact, checkContactValidation, deleteContact, getContactById, getContacts, getUpdates, searchContact, updateContact } from './queries';
const PORT = 4000;


const app = express();
app.use(express.json());

app.use(cors());


app.get('/', (req, res) => {
    res.send('Hi there!');
})

app.post<any>('/add_new_contact', async (req, res) => {
    const { contact } = req.body;
    const isContactExist = await checkContactValidation(contact.first_name, contact.last_name);
    if (isContactExist) {
        return res.send({
            reponse: false,
            msg: 'this contact is allready exist'
        })
    }

  

 await addNewContact(contact);
    const [updated_list] = await getContacts();
    res.send({ response: true, contacts_list: updated_list, msg: `${contact.first_name} ${contact.last_name} added to your contacts` })
})

app.post<any>('/update_contact', async (req, res) => {
    const { updated_contact } = req.body;

     const isContactUpdated = await updateContact(updated_contact);

    if (!isContactUpdated) {
        return res.status(500).send({
            response: false,
            msg: 'data base error'
        })
    }

    const [contacts_list] = await getContacts();
    res.send({
        response: true,
        contacts_list: contacts_list
    })
})

app.get('/contacts_list', async (req, res) => {
    const [contact_list] = await getContacts();
    if (!contact_list.length) {
        return res.send({
            response: false,
            msg: 'your contacts list is empty'
        })
    }
    res.send({
        response: true,
        contacts_list: contact_list,
        msg: null
    })
})

app.delete('/delete_contact/:id', async (req, res) => {
    const { id } = req.params;
    const contact = await getContactById(Number(id));
    if (!contact.length) {
        return res.status(500).send({
            response: false,
            msg: 'data base error'
        })
    }

    const isContactDeleted = await deleteContact(Number(id));
    if (!isContactDeleted) {
        return res.status(500).send({
            response: false,
            msg: 'data base error'
        })
    }
    const [contact_list] = await getContacts();
    res.send({
        response: true,
        contact_list: contact_list,
        msg: `contact ${contact.first_name} ${contact.last_name} deleted`
    })
})

app.post('/search', async (req, res) => {
    const { word } = req.body;
    const contacts = await searchContact(word);
    if (!contacts.length) {
        return res.send({ response: false, msg: 'there is no contact matching your search' })
    }
    res.send({ response: true, result: contacts })
})

app.get('/get_updates', async (req, res) => {
    const updates = await getUpdates();
    res.send({ response: true, updates: updates })
})

app.listen(PORT, () => console.log(`Server is up at ${PORT}`));



