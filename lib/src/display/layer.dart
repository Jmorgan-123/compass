part of compass;

class Layer extends InteractiveObject {
  List<DisplayObject> children;
  bool interactiveChildren;
  
  Layer() {
    children = [];
    interactiveChildren = true;
  }
  
  addChild(DisplayObject node) {
    node.removeFromParent();
    node.parent = this;
    children.add(node);
  }
  
  removeChild(DisplayObject node) {
    if(children.remove(node)){
      node.parent = null;
    }
  }
  
  removeChildren() {
    children.forEach((child) => child.parent = null);
    children.clear();
  }
  
  render(Renderer renderer) {
    children.forEach((child) => child.render(renderer));
  }
}