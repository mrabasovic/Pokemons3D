
import UIKit
import SceneKit
import ARKit
import AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var player: AVAudioPlayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // da nam pokemoni ne bi bili mracni
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main) {
            
            configuration.trackingImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 10
            
            print("Images Successfully Added")
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
 
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        DispatchQueue.main.async {
            
            if let imageAnchor = anchor as? ARImageAnchor {
                // ravan
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)

                let planeNode = SCNNode(geometry: plane)
                
                
                
                node.addChildNode(planeNode)
                
                if imageAnchor.referenceImage.name == "eevee-card" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene1 = SCNScene(named: "art.scnassets/eevee.scn") {
    
                        // opet if let jer mozda u root node-u nema child nodes
                        if let pokeNode = pokeScene1.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
                            
                            // posto postoji onda na ravan dodajemo naseg pokemona
                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "oddish-card" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene2 = SCNScene(named: "art.scnassets/oddish.scn") {
    
                        if let pokeNode = pokeScene2.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
    
                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
                
                if imageAnchor.referenceImage.name == "bulba" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene3 = SCNScene(named: "art.scnassets/Bulba/bulba.scn") {

                        if let pokeNode = pokeScene3.rootNode.childNodes.first {

                            pokeNode.eulerAngles.x = .pi / 2

                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
                
                if imageAnchor.referenceImage.name == "charizard" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene4 = SCNScene(named: "art.scnassets/Charizard/charizarddd.scn") {
                        
                        if let pokeNode = pokeScene4.rootNode.childNodes.first {
                            
                            pokeNode.eulerAngles.x = .pi / 2
                         
                            planeNode.addChildNode(pokeNode)
                            
                        }
                    }
                }
                
                if imageAnchor.referenceImage.name == "chiko" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene = SCNScene(named: "art.scnassets/Chikorita/chikooo.scn") {

                        if let pokeNode = pokeScene.rootNode.childNodes.first {

                            pokeNode.eulerAngles.x = .pi / 2

                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "meow" {
                    if let pokeScene = SCNScene(named: "art.scnassets/Macka/meow.scn") {
    
                        if let pokeNode = pokeScene.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
    
                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "raichu" {
                    planeNode.eulerAngles.x = -.pi / 2
                    if let pokeScene = SCNScene(named: "art.scnassets/Raichu/raicu.scn") {
    
                        if let pokeNode = pokeScene.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
    
                            planeNode.addChildNode(pokeNode)
                            
                            let url = Bundle.main.url(forResource: "raichuQ", withExtension: "wav")
                            self.player = try! AVAudioPlayer(contentsOf: url!)
                            self.player.play()
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "psajdak" {
                    if let pokeScene = SCNScene(named: "art.scnassets/Psajdak/psajdak.scn") {
    
                        if let pokeNode = pokeScene.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
    
                            planeNode.addChildNode(pokeNode)
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "dzigli" {
                    if let pokeScene = SCNScene(named: "art.scnassets/Dzigli/dzigli.scn") {
    
                        if let pokeNode = pokeScene.rootNode.childNodes.first {
                            planeNode.addChildNode(pokeNode)
                            
                            // ovde peva
                            let url = Bundle.main.url(forResource: "dziglipesma", withExtension: "wav")
                            self.player = try! AVAudioPlayer(contentsOf: url!)
                            self.player.play()
                            
                            
                        }
                    }
                }
    
                if imageAnchor.referenceImage.name == "pikachu" {
                    planeNode.eulerAngles.x = -.pi / 2 // rotiramo zbog ravni
                    
                    if let pokeScene = SCNScene(named: "art.scnassets/Pikachu/pikacu.scn") {
    
                        if let pokeNode = pokeScene.rootNode.childNodes.first {
    
                            pokeNode.eulerAngles.x = .pi / 2
    
                            planeNode.addChildNode(pokeNode)
                            
                            let url = Bundle.main.url(forResource: "pikacu", withExtension: "wav")
                            self.player = try! AVAudioPlayer(contentsOf: url!)
                            self.player.play()
                        }
                    }
                }
        }
        
        }
        
        return node
        
    }
    
   
    
}
