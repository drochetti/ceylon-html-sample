import ceylon.html {
    Snippet,
    Ul,
    A,
    Li
}

shared class Pagination(Range<Integer> pages)
        satisfies Snippet<Ul> {
    
    content = Ul {
        classNames = "pagination";
        Li { A { href = "#"; Icon("chevron-left") } },
        for (page in pages) Li { A { page.string; href = "#"; } }
        //Li { A { href = "#"; Icon("chevron-right") } }
    };
    
}