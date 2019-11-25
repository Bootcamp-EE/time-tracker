import jenkins.model.*
import hudson.model.*
import jenkins.plugins.nodejs.tools.*
import hudson.tools.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("jenkins.plugins.nodejs.tools.NodeJSInstallation")

def installations = [];
def installer = new NodeJSInstaller("13.2.0", "", 100)
def installerProps = new InstallSourceProperty([installer])
def installation = new NodeJSInstallation("nodejs", "", [installerProps])
installations.push(installation)


desc.setInstallations(installations.toArray(new NodeJSInstallation[0]))

desc.save()