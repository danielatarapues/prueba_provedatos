import { useRef } from "react";

type Props = {
  onChange: (file: File | null) => void;
  previewUrl: string | null;
};

const ImageUpload = ({ onChange, previewUrl }: Props) => {
  const inputRef = useRef<HTMLInputElement>(null);

  const handleClick = () => {
    inputRef.current?.click();
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0] || null;
    onChange(file);
  };

  return (
    <div className="d-flex align-items-center gap-3">
      {/* Preview */}
      <div
        className="rounded-circle bg-light d-flex align-items-center justify-content-center border overflow-hidden"
        style={{ width: "100px", height: "100px" }}
      >
        {previewUrl ? ( // Usamos la prop en lugar del estado local
          <img
            src={previewUrl}
            alt="preview"
            style={{ width: "100%", height: "100%", objectFit: "cover" }}
          />
        ) : (
          <i
            className="bi bi-person-fill"
            style={{ fontSize: "3rem", color: "#dee2e6" }}
          ></i>
        )}
      </div>

      <input
        type="file"
        accept="image/*"
        ref={inputRef}
        className="d-none"
        onChange={handleChange}
      />

      <button
        type="button"
        className="btn btn-primary btn-sm px-3"
        onClick={handleClick}
      >
        Cargar Imagen
      </button>
    </div>
  );
};

export default ImageUpload;