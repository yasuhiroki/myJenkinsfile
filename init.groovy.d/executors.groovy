import jenkins.model.*

def instance  = Jenkins.getInstance()
def plugins   = [
    "git",
    "workflow-aggregator",
    "docker-workflow",
    "blueocean-pipeline-editor",
]

pm = instance.getPluginManager()
uc = instance.getUpdateCenter()

uc.updateAllSites()

def enablePlugin(pluginName) {
  if (! pm.getPlugin(pluginName)) {
    deployment = uc.getPlugin(pluginName).deploy(true)
    deployment.get()
  }

  def plugin = pm.getPlugin(pluginName)
  if (! plugin.isEnabled()) {
    plugin.enable()
  }

  plugin.getDependencies().each {
    enablePlugin(it.shortName)
  }
}

plugins.each {
  def plugin = pm.getPlugin(it)
  enablePlugin(it)
}

