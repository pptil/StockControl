function downloadBase64Bytes(data, filename, mimeType) {
    var dataAsArrayBuffer = base64ToArrayBuffer(data);
    var blob;
    try { // Para navegadores modernos
        blob = new Blob([dataAsArrayBuffer], { type: mimeType });
        downloadBlobChrome(blob, filename)
    }
    catch (e) {
        // para IE, necesita Blob builder y descarga usando msSaveBlob
        window.BlobBuilder = window.BlobBuilder ||
            window.WebKitBlobBuilder ||
            window.MozBlobBuilder ||
            window.MSBlobBuilder;
        if (window.BlobBuilder) {
            var bb = new BlobBuilder();
            bb.append(dataAsArrayBuffer);
            blob = bb.getBlob(mimeType);
            window.navigator.msSaveBlob(blob, filename);
        }
    }
}

function base64ToArrayBuffer(base64) {
    var binary_string = window.atob(base64);
    var len = binary_string.length;
    var bytes = new Uint8Array(len);
    for (var i = 0; i < len; i++) {
        bytes[i] = binary_string.charCodeAt(i);
    }
    return bytes;
}

function downloadBlobChrome(blob, name) {
    // Convert your blob into a Blob URL (a special url that points to an object in the browser's memory)
    const blobUrl = URL.createObjectURL(blob);

    // Create a link element
    const link = document.createElement("a");

    // Set link's href to point to the Blob URL
    link.href = blobUrl;
    link.download = name;

    // Append link to the body
    document.body.appendChild(link);

    // Dispatch click event on the link
    // This is necessary as link.click() does not work on the latest firefox
    link.dispatchEvent(
        new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
        })
    );

    // Remove link from body
    document.body.removeChild(link);
}