import { LitElement, html } from 'lit';
import { customElement } from 'lit/decorators.js';
import config from '$root/twind.config';
import install from '@twind/with-web-components';
import * as THREE from 'three';
import { WebGLRenderer } from 'three';

@customElement('recipes-carousel')
@install(config)
export default class extends LitElement {
  private renderer: WebGLRenderer;
  constructor() {
    super();

    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );
    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });

    const cube = new THREE.Mesh(geometry, material);

    scene.add(cube);

    camera.position.z = 5;

    function animate() {
      requestAnimationFrame(animate);

      cube.rotation.x += 0.01;
      cube.rotation.y += 0.01;

      renderer.render(scene, camera);
    }

    const renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setSize(500, 500);
    this.renderer = renderer;

    animate();
  }
  firstUpdated() {
    const box = this.shadowRoot!.getElementById('box');
    box!.appendChild(this.renderer.domElement);
  }
  override render() {
    return html` <div id="box"></div> `;
  }
}
