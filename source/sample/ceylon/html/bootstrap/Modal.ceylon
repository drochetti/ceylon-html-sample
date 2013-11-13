import ceylon.html {
    Div,
    Snippet,
    H4,
    Button
}

"Bootstrap modal snippet.
 [See original documentation](http://getbootstrap.com/javascript/#modals)"
shared class Modal(String title,
            Div? body = null,
            String? id = null,
            Boolean closeable = true,
            {Button*} buttons = empty)
        satisfies Snippet<Div> {

    content = Div {
        id = id;
        classNames = "modal fade";
        Div {
            classNames = "modal-dialog";
            Div {
                classNames = "modal-content";
                Div {
                    classNames = "modal-header";
                    closeable then Button {
                        "&times;";
                        classNames = "close";
                        data = [ "dismiss"->"modal" ];
                    },
                    H4(title)
                },
                Div {
                    classNames = "modal-body";
                    body
                },
                !buttons.empty then Div {
                    classNames = "modal-footer";
                    buttons
                }
            }
        }
    };
    
    
}