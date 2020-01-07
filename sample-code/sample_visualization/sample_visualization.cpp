#include <pcl/visualization/cloud_viewer.h>
#include <iostream>
using namespace std;

// ビューワー起動時の一回だけ呼ばれる
void viewerOneOff(pcl::visualization::PCLVisualizer &viewer)
{
  viewer.setBackgroundColor(0.2, 0.2, 0.2);
  cout << "viewerOneOff" << std::endl;
}

// ビューワー起動中の毎フレーム実行される
void viewerPsycho(pcl::visualization::PCLVisualizer &viewer)
{
  cout << "viewerPsycho" << std::endl;
}

int main()
{
  pcl::PointCloud<pcl::PointXYZRGBA>::Ptr p_cloud(new pcl::PointCloud<pcl::PointXYZRGBA>);

  // PointCloudの大きさを決定
  p_cloud->width = 10;
  p_cloud->height = 10;
  p_cloud->points.resize(p_cloud->width * p_cloud->height);

  cout << "Size : " << p_cloud->width * p_cloud->height << std::endl;

  // 直接、値を入力してPointCloudを作成
  for (int h = 0; h < p_cloud->height; h++)
  {
    for (int w = 0; w < p_cloud->width; w++)
    {
      pcl::PointXYZRGBA &point = p_cloud->points[w + h * p_cloud->width];
      point.x = w * 0.1;
      point.y = h * 0.1;
      point.z = 0.0;
      point.r = 255;
      point.g = 0;
      point.b = 0;
      point.a = 0;
    }
  }

  // ビューワーの作成
  pcl::visualization::CloudViewer viewer("PointCloudViewer");
  viewer.showCloud(p_cloud);

  // ビューワー起動時の一回だけ呼ばれる関数をセット
  viewer.runOnVisualizationThreadOnce(viewerOneOff);

  // ビューワー起動中の毎フレーム実行される関数をセット
  viewer.runOnVisualizationThread(viewerPsycho);

  // ビューワー視聴用ループ
  while (!viewer.wasStopped())
  {
  }
  return 0;
}
