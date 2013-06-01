class UrlMappings {

	static mappings = {
        "/userplacerelations/show/$user/$place" (controller: "userPlaceRelation", action: "show")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/"(view:"/index")
		"500"(view:'/error')
	}
}
