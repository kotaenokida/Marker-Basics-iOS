# Kudan Tutorials - Marker Basics

[English README is here](./README_en.md)

このチュートリアルでは、KudanAR を使い始めるための基本を説明します。以前のチュートリアルでは、フレームワークを iOS プロジェクトに統合する方法について説明しました。プロジェクトに ARCameraViewController を設定していない場合は、先に進む前に以前のチュートリアルをチェックすることをお勧めします。

このチュートリアルでは、バンドルされたアセットを利用するため、正しいアセットがプロジェクトにインポートされていることを確認してください。

このサンプルでは以下を利用します。

- Marker: spaceMarker.jpg
- Image: Augmentation: eyebrow.png
- Video: Augmentation: waves.mp4
- Alpha video augmentation: kaboom.mp4
- Model: bloodhoud.armodel / bloodhound.jet
- Model Texture: bloodhound.png

このプロジェクトにはすべてのアセットが含まれていますが、[こちら](https://jp.xlsoft.com/demo2/kudan/tutorials/assets.zip)からダウンロードすることも可能です。

## Image Trackable の設定

Image Trackable を作成するには、まず追跡する画像が必要になります。iOS ネイティブでサポートされていれば、使用する画像のフォーマットについて制限はありません。良いマーカーとは何か？についての情報は以下のブログ記事を参照してください。

[良いマーカーとは? – The Kudan Developer Hub](https://www.xlsoft.com/doc/kudan/ja/what-makes-a-good-marker_jp/)

Note: 良くないマーカーでは、AR がけいれんまたは揺れているように見える問題が発生します。

```objectivec
@property (nonatomic) ARImageTrackable *imageTrackable;
...
// Initialise image trackable
self.imageTrackable = [[ARImageTrackable alloc] initWithImage:[UIImage imageNamed:@"spaceMarker.jpg"] name:@"space"];

// Get instance of image tracker manager
ARImageTrackerManager *trackerManager = [ARImageTrackerManager getInstance];
[trackerManager initialise];

// Add image trackable to image tracker manager
[trackerManager addTrackable:self.imageTrackable];
```

## Image Trackable にコンテンツを追加

Image Trackable にコンテンツを追加するには、コンテンツを対応する ARNode に変換して Trackable の World（マーカーを囲む 3D 空間）に追加する必要があります。Kudan には 4つの異なる ARNode サブクラスがあります。

- ARImageNode
- ARVideoNode
- ARAlphaVideoNode
- ARModelNode

Note: アプリケーションに AR コンテンツを追加するときは、バックグラウンドスレッドに追加することを検討してください。これにより、カメラフィードの失速を防ぐことができます。

### Image Nodes

画像は ARImageNode クラスを使用して表示されます。ARImageNode は画像を使用して初期化されます。画像には、デバイスの OS でサポートされている任意の形式に対応しています。

```objectivec
// Initialise image node
ARImageNode *imageNode = [[ARImageNode alloc] initWithBundledFile:@"eyebrow.png"];

// Add image node to image trackable
[self.imageTrackable.world addChild:imageNode];
```

### Video Nodes

ビデオは ARVideoNode クラスを使用して表示されます。ARVideoNode は、iOS 上のビデオファイルと Android 用のビデオファイルから初期化されたビデオテクスチャを使用して初期化されます。 ビデオファイルは、デバイスの OS でサポートされている任意の形式に対応しています。

```objectivec
// Initialise video node
ARVideoNode *videoNode = [[ARVideoNode alloc] initWithBundledFile:@"waves.mp4"];

// Add video node to image trackable
[self.imageTrackable.world addChild:videoNode];
```

### Alpha Video Nodes

アルファビデオは透明なチャンネルを持つビデオであり、[AR ツールキット](https://www.xlsoft.com/jp/products/kudan/download.html)を使用して透明な PNG とのセットを使って作成することができます。アルファビデオは ARAlphaVideoNode クラスを使用して表示されます。ARAlphaVideoNode はビデオノードと同じように初期化されます。

```objectivec
// Initialise alpha video node
ARAlphaVideoNode *alphaVideoNode = [[ARAlphaVideoNode alloc] initWithBundledFile:@"kaboom.mp4"];

// Add alpha video node to image trackable
[self.imageTrackable.world addChild:alphaVideoNode];
```

### Model Nodes

モデルは ARModelNode クラスを使用して表示されます。ARModelNode は 2つのステップで作成されます。まずモデルは ARModelImporter クラスを使用してインポートされます。次に、テクスチャーのマテリアルがモデルの個々のメッシュノードに適用されます。マテリアルは、カラーマテリアル、テクスチャーマテリアル、またはライトマテリアルのいずれかです。

Note: iOS の場合、テクスチャをモデルに正しくマッピングしていれば、モデルのインポート中にテクスチャが適用されるため、各メッシュノードのライティング値を設定するだけで済みます。

KudanAR で 3Dモデルを使用する際の詳細は、以下のページをチェックしてください。

[3D Models](https://www.xlsoft.com/doc/kudan/3d-models/)

Note: ARLightMaterial に照明を追加しないと、マテリアルは黒く表示されます。

```objectivec
// Import model
ARModelImporter *importer = [[ARModelImporter alloc] initWithBundled:@"ben.armodel"];
ARModelNode *modelNode = [importer getNode];

// Apply ambient light to model mesh nodes
for(ARMeshNode *meshNode in modelNode.meshNodes){
    ARLightMaterial *material = (ARLightMaterial *)meshNode.material;
    material.ambient.value = [ARVector3 vectorWithValuesX:0.8 y:0.8 z:0.8];;  
}

// Add model node to image trackable
[self.imageTrackable.world addChild:modelNode];
```

### Scaling

マーカーに追加する画像／ビデオ／モデルがマーカーと同じサイズでない場合、ARNode をスケーリングすることができます。ビデオ／画像の提供は trackable と同じアスペクト比であるため、正しいスケールを取得するために幅／高さを分割できます。この値を使用して、ノードをスケーリングできます。

注：このチュートリアルでは、x、y、z 軸を個別にスケーリングできますが、均一な値を使用してスケーリングします。

```objectivec
// Image scale
float scale = (float)self.imageTrackable.width / imageNode.texture.width;
[imageNode scaleByUniform:scale];

// Video
float scale = (float)self.imageTrackable.width / videoNode.videoTexture.width ;
[videoNode scaleByUniform:scale];

// Alpha video scale
float scale = (float)self.imageTrackable.width / alphaVideoNode.videoTexture.width;
[alphaVideoNode scaleByUniform:scale];
```

### コンテンツの可視性

各ノードにはブール値があり、ノードを表示するかどうかを決定するために設定できます。この設定はマーカーに複数のノードが接続されていて、それらを一度にすべて表示したくない場合に便利です。次を使用して設定できます。

```objectivec
// Hide image node
[imageNode setVisible:NO];
```

### 利用方法

- [エクセルソフトの Kudan ダウンロードページ](https://www.xlsoft.com/jp/products/kudan/download.html?utm_source=external&utm_medium=github&utm_campaign=xlsoft_Marker-Basics-iOS) から最新の Kudan AR iOS SDK のダウンロードをお申し込みください。
- `KudanAR.framework` をプロジェクトフォルダーにコピーまたは移動します。
- [Build Settings (ビルド設定)] タブで [Build Options (ビルド オプション)] にスクロールして、[Enable Bitcode (ビットコードを有効にする)] を [No (いいえ)] に設定します。
- ビルドして実行します。

### エクセルソフトについて

エクセルソフトは Kudan AR/CV SDK の販売代理店です。

- AR で出来ることを知りたい
- AR の活用方法を相談したい
- デモ／訪問を希望する
- ライブラリの使い方を知りたい
- 価格を知りたい

などのご相談はお気軽に [お問合せフォーム](https://www.xlsoft.com/jp/services/xlsoft_form.html?option2=Kudan&utm_source=external&utm_medium=github&utm_campaign=xlsoft_Marker-Basics-iOS) よりお寄せ下さい。
