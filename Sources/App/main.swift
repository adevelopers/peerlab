import Vapor

let drop = Droplet()
let baseApiPath = "api/v1/"

drop.get("/"){
    request in
    var response:String = "Hello PeerLab Community..."
    response += "\nAPI:\n\(baseApiPath)events/ - get events list\n\(baseApiPath)event/<eventId>/ - get information of event by eventId\n"
    return response
}

drop.get(baseApiPath + "version"){  request in
    return try JSON(node: [
            "version":"1.0.0"
        ])
}


drop.get(baseApiPath + "events"){
    request in
    return "events list"
}



drop.get(baseApiPath + "event", ":event"){
    request in
    
    guard let eventId:Int = request.parameters["event"]?.int else { return "no event ID"}
    
    return try JSON( node: [
        "event": eventId
    ])
}


//drop.resource("posts", PostController())

drop.run()
