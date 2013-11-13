import ceylon.html { Div, Snippet }

shared class ButtonGroup(String? id = null, Div* buttons)
        satisfies Snippet<Div> {

    content = Div {
        classNames = "btn-group";
        buttons
    };
    
}