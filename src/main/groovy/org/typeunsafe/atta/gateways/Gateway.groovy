package org.typeunsafe.atta.gateways

import org.typeunsafe.atta.core.Message
import org.typeunsafe.atta.sensors.Sensor

interface Gateway {

  Gateway sensors(List<Sensor> sensors)
  HashMap<String,Object> lastSensorsData()

  // this is an observer ( receive message, is notified)
  void update(Message message)
  void notifySensor(Sensor sensor)
  void notifyAllSensors()

  //void start()
  void start(Closure work)

  //void provisioning()
  void provisioning(Closure work)


  String id()
  void id(String id)

  String locationName()
  void locationName(String locationName)

  //String topic()
  //void topic(String topic)


  /* TODO
    - emergency
    - problem
    - warning
    - ...
   */

}