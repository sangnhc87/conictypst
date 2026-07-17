#!/usr/bin/env python3
"""Build a photographed-sheet-style TLN fixture from runtime OMR coordinates."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import cv2
import numpy as np


def detect_markers(image: np.ndarray) -> dict[str, tuple[float, float]]:
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    threshold = cv2.adaptiveThreshold(
        gray,
        255,
        cv2.ADAPTIVE_THRESH_GAUSSIAN_C,
        cv2.THRESH_BINARY_INV,
        51,
        15,
    )
    contours, _ = cv2.findContours(
        threshold, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE
    )

    image_area = image.shape[0] * image.shape[1]
    candidates = []
    for contour in contours:
        area = cv2.contourArea(contour)
        x, y, width, height = cv2.boundingRect(contour)
        aspect = width / height if height else 0
        solidity = area / (width * height) if width and height else 0
        if (
            area >= max(35, image_area * 0.00008)
            and area <= image_area * 0.04
            and 0.55 <= aspect <= 1.8
            and solidity >= 0.42
        ):
            moments = cv2.moments(contour)
            if moments["m00"]:
                candidates.append(
                    (
                        moments["m10"] / moments["m00"],
                        moments["m01"] / moments["m00"],
                    )
                )

    if len(candidates) < 4:
        raise RuntimeError(f"Expected four corner markers, found {len(candidates)}")

    top_left = min(candidates, key=lambda point: point[0] + point[1])
    bottom_right = max(candidates, key=lambda point: point[0] + point[1])
    top_right = max(candidates, key=lambda point: point[0] - point[1])
    bottom_left = min(candidates, key=lambda point: point[0] - point[1])
    return {
        "tl": top_left,
        "tr": top_right,
        "br": bottom_right,
        "bl": bottom_left,
    }


def main() -> None:
    if len(sys.argv) != 4:
        raise SystemExit(
            "Usage: test_tln_image_fixture.py BLANK_PNG RUNTIME_JSON OUTPUT_PNG"
        )

    blank_path, runtime_path, output_path = map(Path, sys.argv[1:])
    image = cv2.imread(str(blank_path))
    if image is None:
        raise RuntimeError(f"Cannot read {blank_path}")

    runtime = json.loads(runtime_path.read_text(encoding="utf-8"))
    template = runtime["template"]
    markers = detect_markers(image)
    destination = np.float32(
        [
            [0, 0],
            [template["warp"]["width"], 0],
            [template["warp"]["width"], template["warp"]["height"]],
            [0, template["warp"]["height"]],
        ]
    )
    source = np.float32(
        [markers["tl"], markers["tr"], markers["br"], markers["bl"]]
    )
    inverse = cv2.getPerspectiveTransform(destination, source)

    warped_points = np.float32(
        [[entry["pt"]] for entry in runtime["filled"]]
    )
    source_points = cv2.perspectiveTransform(warped_points, inverse).reshape(-1, 2)

    marker_width = np.linalg.norm(source[1] - source[0])
    radius = max(8, round(marker_width / template["warp"]["width"] * 8.2))
    for x, y in source_points:
        cv2.circle(image, (round(float(x)), round(float(y))), radius, (0, 0, 0), -1)

    if not cv2.imwrite(str(output_path), image):
        raise RuntimeError(f"Cannot write {output_path}")

    print(
        json.dumps(
            {
                "output": str(output_path),
                "markers": markers,
                "radius": radius,
                "filled": len(source_points),
                "size": [image.shape[1], image.shape[0]],
            },
            ensure_ascii=False,
        )
    )


if __name__ == "__main__":
    main()
