
shared class Developer(name, url = null) {
    
    shared String name;

    shared String? url;

}

shared object developers {

    shared {Developer*} core = {
        Developer {
            name = "Gavin King";
            url = "https://profiles.google.com/gavin.king";
        },
        Developer {
            name = "Emmanuel Bernard";
            url = "http://emmanuelbernard.com/+";
        }
    };

    shared {Developer*} community = {
        Developer {
            name = "Daniel Rochetti";
            url = "";
        }
    };

    shared {Developer*} all = concatenate(core, community);

}