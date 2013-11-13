import ceylon.html {
    Html
}
import ceylon.html.serializer {
    NodeSerializer
}
import ceylon.io.charset {
    utf8
}
import ceylon.net.http {
    get,
    contentType,
    Header
}
import ceylon.net.http.server {
    newServer,
    Request,
    Response,
    isRoot,
    Endpoint,
    AsynchronousEndpoint,
    startsWith
}
import ceylon.net.http.server.endpoints {
    serveStaticFile
}

"Endpoint handler that serializes a given [[ceylon.html::Html]]"
void serveHtml(Html page)(Request request, Response response) {
    value serializer = NodeSerializer(response.writeString);
    serializer.serialize(page);
    response.addHeader(Header("X-Powered-By", "Ceylon Html module sample"));
    response.addHeader(Header("Content-Length", serializer.contentLength.string));
    response.addHeader(contentType("text/html", utf8));
}

"Run the module `sample.ceylon.html`."
shared void run() {
    newServer {
        Endpoint {
            path = isRoot();
            service => serveHtml(index);
        },
        AsynchronousEndpoint {
            path = startsWith("/static");
            service => serveStaticFile(".");
            acceptMethod = { get };
        }
    }
    .start();
}