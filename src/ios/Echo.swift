// Plugins/Echo.swift
 
import Foundation
 
@objc(Echo) class Echo : CDVPlugin {
  func echo(command: CDVInvokedUrlCommand) {
    var message = "Hello"
	
    message = message.uppercaseString // Prove the plugin is actually doing something
 
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: message)
    commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId)
  }
}