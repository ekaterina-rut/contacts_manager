export interface IContact {
    id: number,
    first_name: string,
    last_name: string,
    phone: string,
    email: string,
    street: string,
    city: string,
    state: string,
    postal_code: number,
    date_update: string | null,
    total_updates: number
}

export interface IUpdate {
    contact: string,
    update_type: string,
    update_date: Date
}