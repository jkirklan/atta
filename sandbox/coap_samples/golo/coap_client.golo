module coapclient

import coap
import gololang.Async

function main = |args| {

  let request = |server, port, resource| -> promise(): initializeWithinThread(|resolve, reject| {

    try {
      let coapCli = coapClient(server+":"+port+"/"+resource)
      let response = coapCli: getJsonData(): getResponseText()
      resolve(response)
    } catch (err) {
        reject(err)
    }
  })

  request(server="coap://127.0.0.1", port=5683, resource="home")
    : onSet(|response| {
      println(response)
    })
    : onFail(|err| {
        println(err: getMessage())
    })

  request(server="coap://127.0.0.1", port=5686, resource="work")
    : onSet(|response| {
      println(response)
    })
    : onFail(|err| {
        println(err: getMessage())
    })

}

