const BASE_URL = "http://localhost:8080"
export const getData = async (serviceUrl) => {  //    /hello
    let data = await fetch(serviceUrl, {
        method: 'GET'
    }).then(response =>  response).then(posts => posts)

    return data;
}