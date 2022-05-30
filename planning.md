User: 
    id: fetched from firebase auth
    email: fetched from firebase auth
    password: fetched from firebase auth
    userType: "customer" or "barber" (assigned at signup)


Customer:
    id: random string by firebase
    u_id(FK): the corresponding id in the user table
    bookings: [b_id, b_id, b_id]
    name: string
    phone: string
    address: string
    image: string
    

Barbershop: 
    id: random string by firebase
    u_id(FK): the corresponding id in the user table
    sevices: [s_id, s_id, s_id],
    bookings: [b_id, b_id, b_id]
    rating: {
        score: float / 5
        count: int
    }
    name: string
    phone: string
    address: string
    location: {
        lat: float
        lng: float
    }
    image: string
    description: string
    open_time: string
    close_time: string
    open_days: [string, string, string, string, string, string, string]
    slot_length: float (possible values 1, 0.5) : radio button


Booking:
    id: random string by firebase 
    c_id(FK): the corresponding id in the customer table
    sh_id(FK): the corresponding id in the barber table
    date: string
    time: string
    is_cancelled: boolean
    services: [s_id, s_id, s_id]
    total_price: float
    is_paid: boolean
    is_completed: boolean

Service: 
    id: random string by firebase
    sh_id(FK): the corresponding id in the barber table
    name: string
    price: string
    description: string
    

# how to show a customer their bookings:
1- select * bookings where c_id = 1
2- for bookingid in customer.bookings 
    select * from bookings where b_id = bookingid

Service:


FLOW => 

    NAVIGATOR Service + routing 

    SIGNUP page 

    CUSTOMER: 
        VIEW PROFILE + edit
        LIST OF SHOPS + SEARCH (H)
        VIEW SHOP DETAILS 
        MAKE BOOKING: page with progress tabs (1- select slot 2- select services 3- checkout(not part of this sprint))
        VIEW BOOKINGS + press to cancel
    
    BARBER:
        VIEW BOOKINGS + press to cancel (H)
        VIEW SHOP PROFILE + edit time slots + edit services
        ADD NEW SERVICE
