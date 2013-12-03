import ceylon.html {
    ...
}

import sample.ceylon.html.bootstrap {
    Icon,
    Modal, Pagination
}
import sample.ceylon.html.data { developers }

Modal infoModal = Modal {
    title = "";
    id = "info-modal";
    Div {
        
    };
    Button {
        classNames = "btn btn-primary btn-lg";
    }
};

shared Html index = Html {

    doctype = html5;

    Head {
        title = "ceylon-html sample page";

        CharsetMeta("utf-8"),
        Meta("description", "A full ceylon-html sample/test"),
        Meta("author", "Daniel Rochetti"),

        CssLink("//cdn.jsdelivr.net/bootstrap/3.0.2/css/bootstrap.css"),
        CssLink("//cdn.jsdelivr.net/bootstrap/3.0.2/css/bootstrap-theme.min.css"),
        CssLink("//cdn.jsdelivr.net/fontawesome/4.0.3/css/font-awesome.min.css"),
        CssLink("static/style.css"),

        Script { src = "//cdn.jsdelivr.net/modernizr/2.6.3/modernizr.min.js"; }
    };

    Body {

        data = [
            "spy"->"scroll",
            "target"->"#side-menu"
        ];

        Header {
            id = "master-navbar";
            classNames = "navbar navbar-inverse navbar-fixed-top";
            Div {
                classNames = "container";
                Div {
                    classNames = "pull-right";
                    A {
                        href = "#info-modal";
                        classNames = "btn btn-inverse navbar-btn";
                        data = [ "toggle"->"modal" ];
                        
                        Icon("info-circle")
                    }
                }
            }
        },

        Section {
            id = "content";
            Div {
                classNames = "container";
                Div {
                    classNames = "jumbotron";
                    
                    H1("``Icon("html5")`` Welcome to ceylon-html"),

                    P {
                        "This project aims to provide a full-featured HTML5 page
                         as a proof of concept for the ``Strong("ceylon-html")``
                         SDK module.";
                        classNames = "lead";
                    },
                    P(""),

                    Div {
                        A {
                            href = "http://github.com/drochetti/ceylon-html-sample";
                            target = "_blank";
                            classNames = "btn btn-primary btn-lg";

                            Icon("github-square"),
                            Span("View source")
                        },
                        A {
                            href = "http://ceylon-lang.org";
                            target = "_blank";
                            classNames = "btn btn-default btn-lg";

                            Icon("home"),
                            Span("Visit Ceylon website")
                        }
                    }
                },

                Div {
                    classNames = "row";
                    Div {
                        classNames = "col-md-3";
                        Div {
                            data = [
                                "spy"->"affix",
                                "offset-top"->"350"
                            ];
                            Aside {
                                id = "side-menu";
                                Ul {
                                    classNames = "nav nav-pills nav-stacked";
                                    Li {
                                        A { "Text formatting"; href = "#text-formatting"; }
                                    },
                                    Li {
                                        A { "Tables"; href = "#tables"; }
                                    },
                                    Li {
                                        A { "Forms"; href = "#forms"; }
                                    }
                                }
                            }
                        }
                    },
                    Section {
                        classNames = "col-md-9";
                        
                        Article {
                            id = "text-formatting";
                            Header {
                                H2 {
                                    "Text formatting";
                                    classNames = "page-header";
                                    Small("Inline text format elements")
                                }
                            },
                            P("This is the ``Abbr("ABBR")`` element."),
                            P("This is the ``B("b")`` element."),
                            //P("This is the ``Cite("cite")`` element."),
                            P("This is the ``Code("code")`` element."),
                            //P("This is the ``Del("del")`` element."),
                            //P("This is the ``Dfn("dfn")`` element."),
                            P("This is the ``Em("em")`` element."),
                            P("This is the ``I("i")`` element."),
                            //P("This is the ``Ins("ins")`` element."),
                            //P("This is the ``Kbd("kbd")`` element."),
                            //P("This is the ``Mark("mark")`` element.")
                            P("This is the ``Q("q")`` element."),
                            P("This is the ``S("s")`` element."),
                            P("This is the ``Samp("samp")`` element."),
                            P("This is the ``Small("small")`` element."),
                            P("This is the ``Strong("strong")`` element."),
                            P("This is the ``Sub("sub")`` element."),
                            P("This is the ``Sup("sup")`` element.")
                            //P("This is the ``Var("var")`` element.")
                        },

                        Article {
                            id = "tables";
                            Header {
                                H2 {
                                    "Tables";
                                    classNames = "page-header";
                                    Small("Tabular data display")
                                }
                            },
                            Table {
                                classNames = "table table-striped";
                                header = {
                                    Th("#"),
                                    Th("Name"),
                                    Th("Value")
                                };
                                for (i->developer in developers.core.indexed)
                                    Tr {
                                        Td(i.string),
                                        Td(developer.name),
                                        Td(developer.url else "N/A")
                                    }
                            },
                            Pagination(1..4)
                        },

                        Article {
                            id = "forms";
                            Header {
                                H2 {
                                    "Forms";
                                    classNames = "page-header";
                                    Small("Data input fields")
                                }
                            },
                            Form {
                                action = "#";
                            }
                        }

                    }
                }

            },

            infoModal,

            P { "Powered by Ceylon ``language.version``"; }

        },

        Script { src = "//cdn.jsdelivr.net/jquery/1.10.2/jquery-1.10.2.min.js"; },
        Script { src = "//cdn.jsdelivr.net/bootstrap/3.0.2/js/bootstrap.min.js"; }

    };

};
