using Microsoft.ML.Data;

namespace c6_AIFaceDetection
{
    public class NoralizationData
    {
        [ColumnName("input")]
        [VectorType(3, 240, 320)]
        public VBuffer<float> Reshape;

        public static void MeanAndScaleNormalization(NoralizationData input, NoralizationData output)
        {
            output.Reshape = new VBuffer<float>(
                input.Reshape.Length,
                input.Reshape.GetValues().ToArray().Select(v => (v - 127) / 128).ToArray());
        }
    }

    public class ImageNetData
    {
        public string ImagePath { get; set; }
    }
}
