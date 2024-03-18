import glob
import imageio
import matplotlib.pyplot as plt
import cv2
import numpy as np
files = glob.glob('../synthetic/output/depth000000*')

for i in files:
    angle = int(i[-7:-4])
    print (angle)

    # now let's compute the histogram of the depth values
    img = imageio.v2.imread(i)[:, :, 0]
    hst = img.flatten()[::10]
    plt.hist(hst, bins=25)

    plt.title(f'Distribution of depth values, view angle {angle}')
    plt.xlabel('depth values')
    plt.ylabel('frequency')
    plt.savefig(f'plots/depth_hist{angle}.png')
    plt.close()

    plt.imshow(img)
    plt.title(f'Depth image for view angle {angle}')
    plt.colorbar()
    plt.savefig(f'plots/depth_image{angle}.png')
    plt.close()

    gX = cv2.Sobel(img, ddepth=cv2.CV_32F, dx=1, dy=0, ksize=3)
    gY = cv2.Sobel(img, ddepth=cv2.CV_32F, dx=0, dy=1, ksize=3)


    gX = cv2.convertScaleAbs(gX)
    gY = cv2.convertScaleAbs(gY)
    # combine the gradient representations into a single image
    combined = cv2.addWeighted(gX, 0.5, gY, 0.5, 0) * 2.0
    plt.imshow(combined, cmap='gray')
    plt.title(f'Detected edges in the depth image for view angle {angle}')
    plt.colorbar()
    plt.savefig(f'plots/depth_edges{angle}.png')
    plt.close()

files = glob.glob('../synthetic/output/depth*')
means = {}
means_all = []
for i in (30, 60, 90, 120, 150):
    means[i] = []
for i in files:
    angle = int(i[-7:-4])
    print(angle)
    img = imageio.v2.imread(i)[:, :, 0]
    mean = np.mean(img)
    means_all.append(mean)
    means[angle].append(mean)

plt.title(f'Depth means across all images')
plt.hist(means_all, bins=30)
plt.title('Distribution of average means across all depth images')
plt.xlabel('mean depth value (0 to 255)')
plt.ylabel('frequency')
plt.savefig(f'plots/depth_means_across_all.png')
plt.close()

for i in (30, 60, 90, 120, 150):
    plt.title(f'Depth means for images with view angle {i}')
    plt.hist(means[i], bins=30)
    plt.title(f'Distribution of average means across all depth images view angle {i}')
    plt.xlabel('mean depth value (0 to 255)')
    plt.ylabel('frequency')
    plt.savefig(f'plots/depth_means_images_view_angle_{i}.png')
    plt.close()

files = glob.glob('../synthetic/output/scene*.png')
means = {}
means_all = []
for i in (30, 60, 90, 120, 150):
    means[i] = []
for i in files:
    angle = int(i[-7:-4])
    print(angle)
    img = imageio.v2.imread(i)[:, :, 0]
    mean = np.mean(img)
    means_all.append(np.mean(mean))
    means[angle].append(mean)
    means[angle].append(mean)

plt.title(f'Color intensity means across all images')
plt.hist(means_all, bins=30)
plt.title('Distribution of average color intensities across all RGB images')
plt.xlabel('mean depth value (0 to 255)')
plt.ylabel('frequency')
plt.savefig(f'plots/color_intensity_means_across_all.png')
plt.close()

for i in (30, 60, 90, 120, 150):
    plt.title(f'Color intensity means for images with view angle {i}')
    plt.hist(means[i], bins=30)
    plt.title(f'Distribution of average color intensities across all RGB images view angle {i}')
    plt.xlabel('mean depth value (0 to 255)')
    plt.ylabel('frequency')
    plt.savefig(f'plots/color_intens_means_images_view_angle_{i}.png')
    plt.close()