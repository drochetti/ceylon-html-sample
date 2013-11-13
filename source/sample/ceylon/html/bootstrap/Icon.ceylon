import ceylon.html { I, Snippet }

"Bootstrap/FontAwesome icon snippet."
shared class Icon(String name)
        satisfies Snippet<I> {

    content = I {
        classNames = "fa fa-``name``";
    };

}
